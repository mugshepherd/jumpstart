const config = require('config');
const express = require('express');
const swaggerUi = require('swagger-ui-express');
const openApiDocumentation = require('./openApiDocumentation');

const { temp } = require('./src/index');

const app = express();
const port = config.get('app.port');

app.use(express.json());

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(openApiDocumentation));

app.post('/', (req, res) => {
  res.status(200).json(temp());
});

app.get('/healthz', (req, res) => {
  res.sendStatus(200);
});

app.listen(port, () => {
  console.info(`App listening on port:${port}`);
});
