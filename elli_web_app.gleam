// A very simple web application using the Elli web server.
// https://github.com/elli-lib/elli
//
// Run the application with the `start_link/0` function.

import elli.{Get, Delete}

// The handle/2 callback is used by Elli to response to requests
//
// It serves as the router for our application.
//
pub fn handle(req, _arg) {
  method = elli.method(req)
  path = elli.path(req)
  case method, path {
    Get, [] -> home()
    Get, ["hello"] -> greet("world")
    Get, ["hello", "jane"] -> greet_jane()
    Get, ["hello", name] -> greet(name)
    Delete, _ -> reject_delete()
    _, _ -> not_found()
  }
}

// Response builder functions

fn home() {
  struct(200, [], "Hello, world!")
}

fn greet_jane() {
  struct(200, [], "Jane, so good to see you!")
}

fn greet(name) {
  struct(200, [], string.concat(["Hello, ", name, "!"])
}

fn reject_delete() {
  struct(405, [], "Sorry, no DELETE requests allowed.")
}

fn not_found() {
  struct(404, [], "Not found")
}

// Lastly, a function to start the server.

// The start_link/0 function can be used to create a new
// Elli web server process running this handler module.
//
pub fn start_link() {
  elli.start_link(self, [], [elli.Port(3000)])
}
