var UserSearchBox = React.createClass({

  getInitialState: function(props){
    return{
      filteredUser: this.props.users,
      selectedUserId: [],
      selectedUserName: []
    };
  },

  handleWriteDown: function(input){
    var result = this.props.users.filter(function(user){
      if (user.first_name == input) return true;
    });
    this.setState({filteredUser: result})
  },

  handleClick: function(userId, userName) {
    var filteredUser = this.state.filteredUser;
    this.setState({
      selectedUserId: this.state.selectedUserId.concat(userId),
      selectedUserName: this.state.selectedUserName.concat(userName)
    });
    filteredUser.filter(function(user, i){
      if (user.id == userId) filteredUser.splice(i,1);})
  },


  render: function(){
    var userlist = this.state.filteredUser.map(function(user){

    return (<UserList key={user.id} user_id={user.id} name={user.first_name} onClickUser={this.handleClick}/>);
    }.bind(this));

    return(
      <div>
        <div className="selectedUserName">
          {this.state.selectedUserName}
        </div>
        <UserSearchForm selectedUserId={this.state.selectedUserId} onChangeForm={this.handleWriteDown} />
        <ul>
          {userlist}
        </ul>
      </div>
    );
  }
});
