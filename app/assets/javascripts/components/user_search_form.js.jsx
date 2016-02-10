var UserSearchForm = React.createClass({
  handleWriteDown: function(){
    var input = ReactDOM.findDOMNode(this.refs.username).value.trim();
    this.props.onChangeForm(input);
    console.log(this.props)
  },

  render: function(){

    var hiddenlist = this.props.selectedUsers.map(function(user){
      return(<input key={user.id} type="hidden" name="user_id" value={user.id} />);
    });

    return(
      <form className="UserSearchForm">
        <input type="text" ref="username" onKeyUp={this.handleWriteDown}/>
        {hiddenlist}
      </form>
    );
  }
});
