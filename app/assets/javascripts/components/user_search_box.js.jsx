var UserSearchBox = React.createClass({

  getInitialState: function(props){
    return{
      filteredUsers: this.props.users,
      selectedUsers: []
    };
  },

  handleWriteDown: function(input){
    var result = this.props.users.filter(function(user){
      if (user.first_name == input) return true;
    });
    this.setState({filteredUsers: result})
  },

  handleClick: function(user) {
    var filteredUsers = this.state.filteredUsers;
    this.setState({
      selectedUsers: this.state.selectedUsers.concat(user),
    });
    filteredUsers.filter(function(filteredUser, i){
      if (filteredUser.id == user.id) filteredUsers.splice(i,1);
    })
  },


  render: function(){
    var userlist = this.state.filteredUsers.map(function(filteredUser){
    return (<UserList key={filteredUser.id} user={filteredUser} onClickUser={this.handleClick} />);
    }.bind(this));

    return(
      <div>
        <div className="selectedUsers">
          {this.state.selectedUsers}
        </div>
        <UserSearchForm selectedUsers={this.state.selectedUsers} onChangeForm={this.handleWriteDown} />
        <ul>
          {userlist}
        </ul>
      </div>
    );
  }
});
