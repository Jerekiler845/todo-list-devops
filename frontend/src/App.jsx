import React, { useState, useEffect } from 'react';
import TareaForm from './components/TareaForm';
import TareaList from './components/TareaList';
import { getTareas, createTarea, updateTareaStatus } from './services/api';
import './App.css';

function App() {
  const [tareas, setTareas] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadTareas();
  }, []);

  const loadTareas = async () => {
    try {
      setLoading(true);
      const data = await getTareas();
      setTareas(data);
      setError(null);
    } catch (err) {
      setError('Error al cargar las tareas');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const handleCreateTarea = async (descripcion) => {
    try {
      const nuevaTarea = await createTarea(descripcion);
      setTareas([nuevaTarea, ...tareas]);
      setError(null);
    } catch (err) {
      setError('Error al crear la tarea');
      console.error(err);
    }
  };

  const handleToggleTarea = async (id, completada) => {
    try {
      await updateTareaStatus(id, completada);
      setTareas(
        tareas.map((tarea) =>
          tarea.id === id ? { ...tarea, completada } : tarea
        )
      );
      setError(null);
    } catch (err) {
      setError('Error al actualizar la tarea');
      console.error(err);
    }
  };

  return (
    <div className="App">
      <div className="container">
        <h1>📝 Gestor de Tareas</h1>
        <TareaForm onSubmit={handleCreateTarea} />
        {error && <div className="error-message">{error}</div>}
        {loading ? (
          <p className="loading">Cargando tareas...</p>
        ) : (
          <TareaList tareas={tareas} onToggle={handleToggleTarea} />
        )}
      </div>
    </div>
  );
}

export default App;
