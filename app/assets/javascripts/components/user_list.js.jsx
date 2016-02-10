var UserList = React.createClass({

  handleClickUser: function(){
    this.props.onClickUser(this.props.user);
  },

  render: function(){
    return(
      <li className="UserList" onClick={this.handleClickUser}>
        <User className="User" user={this.props.user} />
      </li>
    );
  }
});
