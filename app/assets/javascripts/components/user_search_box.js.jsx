var UserSearchBox = React.createClass({

  getInitialState: function(props){
    return{
      filteredUser: this.props.users,
      selectedUserId: [],
      selectedUserName: []
    };
  },

  handleWriteDown: function(input){

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
        <UserSearchForm onChangeForm={this.handleWriteDown} />
        <ul>
          {userlist}
        </ul>
      </div>
    );
  }
});
