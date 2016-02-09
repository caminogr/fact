var UserSearchBox = React.createClass({

  getInitialState: function(props){
    return{
      filteredUser: this.props.users,
      selectedUserId: [],
      selectedUserName: []
    };
  },

  handleClick: function(userId, userName) {

  },


  render: function(){
    var userlist = this.state.filteredUser.map(function(user){

    return (<UserList key={user.id} user_id={user.id} name={user.first_name} onClickUser={this.handleClick}/>);
    }.bind(this));
  }
});
