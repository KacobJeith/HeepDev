import React from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import DraggableContainer from './DraggableContainer';
import Sidebar from './Sidebar';

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      clientList: [],
      sidebarVisible: false,
    }

    this.loadClientsFromServer = this.loadClientsFromServer.bind(this);
  }

  // ClientList AJAX
  loadClientsFromServer(url) {
      $.ajax({
      url: url,
      cache: false,
      success: (data) => {
        this.setState({clientList: data});

        console.log(this.state.clientList);

      },
      error: function(xhr, status, err) {
        console.error(url, status, err.toString());
      }
    });

  }

  componentDidMount(){
    this.loadClientsFromServer('/api/clients');
    this.loadClientsFromServer.bind(this);
  }

  closeSidebar() {
    if(this.state.sidebarVisible == true){
      this.setState({sidebarVisible: false});
    }
  }

  render() {
    const styles = {
        header: {
          backgroundColor: "#43464c", 
          height: 40,
          width: "100%",
          color: "#e1e3e8",
          textIndent: 10
        },
        sidebarOpen: {
          position: "absolute",
          top: 40,
          left: 250,
          transition: "left .3s ease-in-out",
          overflow: "auto"
        },
        sidebarClosed: {
          position: "absolute",
          top: 40,
          transition: "left .3s ease-in-out",
          left: 0,
          overflow: "auto"
        },
        footer : {
          position: "fixed",
          bottom:0,
          left:0,
          right:0,
          height: 30,
          backgroundColor: "#43464c", 
          color: "#e1e3e8"
        }
      };

    const inputs = {
      header: {
        style: styles.header,
        key: "Header"
      },
      sidebar: {
        sidebarVisible: this.state.sidebarVisible,
        closeSidebar: () => this.closeSidebar()
      },
      flowchartContainer: {
        style: this.state.sidebarVisible ? styles.sidebarOpen : styles.sidebarClosed
      },
      flowchart: {
          hideSourceOnDrag: true,
          sidebarVisible: this.state.sidebarVisible,
          clientList: this.state.clientList,
      },
      footer : {
        style: styles.footer,
      }
    }

    return (<div>
            <h1 {...inputs.header}> Client Dashboard <hr></hr></h1>
            <Sidebar {...inputs.sidebar} />
            <div {...inputs.flowchartContainer}>
              <DraggableContainer {...inputs.flowchart}/>
            </div>
            <footer {...inputs.footer}> <hr></hr> &copy; 2016 Jacob Dylan. </footer>
            </div>
    );
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById('root')
);
