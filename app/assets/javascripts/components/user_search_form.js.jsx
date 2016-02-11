var UserSearchForm = React.createClass({
  handleWriteDown: function(){
    var input = ReactDOM.findDOMNode(this.refs.username).value.trim();
    this.props.onChangeForm(input);
    console.log(this.props)
  },

  render: function(){

    var hiddenlist = this.props.selectedUsers.map(function(user){
      return(<input key={user.id} type="hidden" name="group[user_ids][]" value={user.id} />);
    });

    return(
      <form action="/groups" method="post" className="UserSearchForm">
        <label>グループ名</label>
        <input type="text" name="group[name]" />
        <br/>
        <label>グループに追加する</label>
        <input type="text" ref="username" onKeyUp={this.handleWriteDown}/>
        {hiddenlist}
        <input type="submit" value="作成" />
      </form>
    );
  }
});
