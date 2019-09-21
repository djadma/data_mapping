import React from 'react';
import { MDBDataTable } from 'mdbreact';

class Questions extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      questions: []
    };
  }

  componentDidMount() {
    const url = "/api/questions";
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ questions: response.questions }))
      .catch(() => this.props.history.push("/"));
  }

  render() {
    const { questions } = this.state;
    const data = {
      columns: [
        {
          label: 'Title',
          field: 'title',
          sort: 'asc',
          width: 270
        },
        {
          label: 'Mapping Column',
          field: 'mapping',
          sort: 'asc',
          width: 150
        },
        {
          label: 'Role',
          field: 'role',
          sort: 'asc',
          width: 200
        }
      ],
      rows: questions
    };
    return (
      <MDBDataTable
        striped
        bordered
        small
        data={data}
      />
    );
  }
  
}

export default Questions;