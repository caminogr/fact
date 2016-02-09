var User = React.createClass({

  handleClickUser: function(){
    var user_id = this.props.user_id
    this.props.onClickUser(user_id);
  },


  render: function(){
    return(
      <div className="User">
        <p onClick={this.handleClickUser}>
          {this.props.name}
        </p>
      </div>
    );
  }
});
