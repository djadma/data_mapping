import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Questions from "../components/Questions";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/questions" exact component={Questions} />
    </Switch>
  </Router>
);