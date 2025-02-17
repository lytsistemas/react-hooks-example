import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  // Declarar una variable de estado 'counter' con valor inicial 0
  const [counter, setCounter] = useState(0);

  // Hook useEffect para registrar el valor del contador cada vez que cambia
  useEffect(() => {
    console.log(`Valor del contador: ${counter}`);
  }, [counter]);

  return (
    <div className="App">
      <header className="App-header">
        {/* Mostrar el valor actual del contador */}
        <h1>Counter: {counter}</h1>
        {/* Botón para incrementar el valor del contador */}
        <button onClick={() => setCounter(counter + 1)}>Increment</button>
      </header>
    </div>
  );
}

export default App;
