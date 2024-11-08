import React, { useEffect, useState } from 'react';

function App() {
  const [person, setPerson] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch('http://localhost:8080/api/people', {
      method: 'GET',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    })
      .then(response => {
        console.log('Response status:', response.status);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
      })
      .then(data => {
        console.log('Received data:', data);
        setPerson(data);
      })
      .catch(error => {
        console.error('Error details:', error);
        setError(error.message);
      });
  }, []);

  return (
    <div className="App">
      <h1>Person Information</h1>
      {error && <p style={{color: 'red'}}>Error: {error}</p>}
      {person ? (
        <div>
          {Array.isArray(person) ? (
            person.map(p => (
              <div key={p.id}>
                <p>ID: {p.id}</p>
                <p>Name: {p.name}</p>
                <hr />
              </div>
            ))
          ) : (
            <p>Invalid data format</p>
          )}
        </div>
      ) : (
        <p>Loading...</p>
      )}
    </div>
  );
}

export default App; 