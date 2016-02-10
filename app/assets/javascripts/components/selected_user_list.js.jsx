var SelectedUserList = React.createClass({

  render: function(){

    return(
      <span className="SelectedUserList">
        {this.props.selectedUser.first_name}
      </span>
    );
  }


});
