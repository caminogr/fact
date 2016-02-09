var UserList = React.createClass({

  handleClickUser: function(){
  },

  render: function(){
    return(
      <li className="UserList" onClick={this.handleClickUser}>
        <User className="User" name={this.props.name}/>
      </li>
    );
  }
});
