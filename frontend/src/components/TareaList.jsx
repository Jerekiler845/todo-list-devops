import React from 'react';
import TareaItem from './TareaItem';
import './TareaList.css';

const TareaList = ({ tareas, onToggle }) => {
  if (tareas.length === 0) {
    return <p className="empty-message">No hay tareas. ¡Crea una nueva!</p>;
  }

  return (
    <div className="tarea-list" data-testid="tarea-list">
      {tareas.map((tarea) => (
        <TareaItem key={tarea.id} tarea={tarea} onToggle={onToggle} />
      ))}
    </div>
  );
};

export default TareaList;
