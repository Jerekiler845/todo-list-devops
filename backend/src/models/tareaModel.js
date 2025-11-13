const pool = require('../config/database');

class TareaModel {
  /**
   * Obtiene todas las tareas
   * @returns {Promise<Array>} Lista de tareas
   */
  static async getAll() {
    const [rows] = await pool.query(
      'SELECT * FROM tareas ORDER BY fecha_creacion DESC'
    );
    return rows;
  }

  /**
   * Crea una nueva tarea
   * @param {string} descripcion - Descripción de la tarea
   * @returns {Promise<Object>} Tarea creada
   */
  static async create(descripcion) {
    const [result] = await pool.query(
      'INSERT INTO tareas (descripcion, completada) VALUES (?, false)',
      [descripcion]
    );

    const [rows] = await pool.query('SELECT * FROM tareas WHERE id = ?', [
      result.insertId,
    ]);
    return rows[0];
  }

  /**
   * Actualiza el estado de completitud de una tarea
   * @param {number} id - ID de la tarea
   * @param {boolean} completada - Estado de completitud
   * @returns {Promise<Object>} Tarea actualizada
   */
  static async updateStatus(id, completada) {
    await pool.query('UPDATE tareas SET completada = ? WHERE id = ?', [
      completada,
      id,
    ]);

    const [rows] = await pool.query('SELECT * FROM tareas WHERE id = ?', [id]);
    return rows[0];
  }

  /**
   * Elimina todas las tareas (para testing)
   * @returns {Promise<void>}
   */
  static async deleteAll() {
    await pool.query('DELETE FROM tareas');
  }
}

module.exports = TareaModel;
