import { serve } from "@hono/node-server";
import { Hono } from "hono";
import { cors } from "hono/cors";

const app = new Hono();
app.use(cors());
app.get("/", (c) => {
  return c.text("Hello Hono! and docker and kennedy mwangi mwaniki");
});

const port = Number(process.env.PORT || 3000);
console.log(`Server is running on port ${port}`);

serve({
  fetch: app.fetch,
  port,
});
