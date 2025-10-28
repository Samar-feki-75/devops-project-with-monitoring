import React, { useEffect, useState } from 'react';

function App() {
  const [message, setMessage] = useState('');
  const API_URL = process.env.REACT_APP_API_URL;

  useEffect(() => {
    fetch(`${API_URL}/`)
      .then(res => res.json())
      .then(data => setMessage(data.message))
      .catch(err => console.error(err));
  }, [API_URL]);

  return (
    <div>
      <h1>Frontend Connected!</h1>
      <p>{message}</p>
    </div>
  );
}

export default App;