const express = require('express');
const cors = require('cors');
const tareaRoutes = require('./routes/tareaRoutes');

const app = express();

// Middlewares
app.use(cors());
app.use(express.json());

// Routes
app.use('/api', tareaRoutes);

// Health check
app.get('/health', (req, res) => {
  res.json({ status: 'OK' });
});

module.exports = app;
