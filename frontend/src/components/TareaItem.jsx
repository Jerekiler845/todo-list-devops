import React from 'react';
import './TareaItem.css';

const TareaItem = ({ tarea, onToggle }) => {
  const handleToggle = () => {
    onToggle(tarea.id, !tarea.completada);
  };

  return (
    <div className="tarea-item" data-testid={`tarea-${tarea.id}`}>
      <input
        type="checkbox"
        checked={!!tarea.completada}
        onChange={handleToggle}
        data-testid={`checkbox-${tarea.id}`}
      />
      <span className={tarea.completada ? 'completada' : ''}>
        {tarea.descripcion}
      </span>
    </div>
  );
};

export default TareaItem;
