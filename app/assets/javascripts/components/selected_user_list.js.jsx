var SelectedUserList = React.createClass({

  handleClickRemoveUser: function(){
    this.props.onClickUser(this.props.selectedUser);
  },

  render: function(){

    return(
      <a href="#" className="SelectedUserList border-radius" onClick={this.handleClickRemoveUser}>
        {this.props.selectedUser.first_name}
        <i className="fa fa-times"></i>
      </a>
    );
  }


});
