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

  handleClickRemoveUser: function(user){
    var selectedUsers = this.state.selectedUsers;
    this.setState({
      filteredUsers: this.state.filteredUsers.concat(user)
    });
    selectedUsers.filter(function(selectedUser, i){
      if (selectedUser.id == user.id) selectedUsers.splice(i,1);
    })
  },

  render: function(){
    var userlist = this.state.filteredUsers.map(function(filteredUser){
      return (<UserList key={filteredUser.id} user={filteredUser} onClickUser={this.handleClick} />);
    }.bind(this));

    var selecteduserlist = this.state.selectedUsers.map(function(selectedUser){
       return (<SelectedUserList key={selectedUser.id} selectedUser={selectedUser} onClickUser={this.handleClickRemoveUser} />);
    }.bind(this));

    return(
      <div>
        <div className="selectedUsers">
          {selecteduserlist}
        </div>
        <UserSearchForm selectedUsers={this.state.selectedUsers} onChangeForm={this.handleWriteDown} />
        <ul>
          {userlist}
        </ul>
      </div>
    );
  }
});
