var UserSearchBox = React.createClass({

  getInitialState: function(props){
    return{
      filteredUser: this.props.users,
      selectedUserId: [],
      selectedUserName: []
    };
  },

  render: function(){
    var userlist = this.state.filteredUser.map(function(user){

    return (<UserList/>);
    };
  }
});
