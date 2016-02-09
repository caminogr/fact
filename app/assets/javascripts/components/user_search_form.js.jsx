var UserSearchForm = React.createClass({
  handleWriteDown: function(){
    var input = ReactDOM.findDOMNode(this.refs.username).value.trim();
    this.props.onChangeForm(input);
  },

  render: function(){

    var hiddenlist = this.props.selectedUserId.map(function(userId){
      return(<input key={userId} type="hidden" name="user_id" value={userId} />);
    });

    return(
      <form className="UserSearchForm"  >
        <input type="text" ref="username" onKeyUp={this.handleWriteDown}/>
        {hiddenlist}
      </form>
    );
  }
});
