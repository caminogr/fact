var UserList = React.createClass({


  render: function(){
    return(
      <li className="UserList">
        <User className="User" name={this.props.name}/>
      </li>
    );
  }
});
