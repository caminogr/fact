var SelectedUserList = React.createClass({

  handleClickRemoveUser: function(){
    this.props.onClickUser(this.props.selectedUser);
  },

  render: function(){

    return(
      <span className="SelectedUserList" onClick={this.handleClickRemoveUser}>
        {this.props.selectedUser.first_name}
      </span>
    );
  }


});
