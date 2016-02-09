var UserList = React.createClass({

  handleClickUser: function(){
    this.props.onClickUser(this.props.user_id, this.props.name);
  },

  render: function(){
    return(
      <li className="UserList" onClick={this.handleClickUser}>
        <User className="User" name={this.props.name} user_id={this.props.user_id} />
      </li>
    );
  }
});
