var UserList = React.createClass({

  handleClickUser: function(){
    this.props.onClickUser(this.props.user);
    $('#user_search_form').val("");
  },

  render: function(){
    return(
      <li className="UserList" onClick={this.handleClickUser}>
        <User className="User" user={this.props.user} />
      </li>
    );
  }
});
