var UserSearchForm = React.createClass({
  handleWriteDown: function(){
    var input = ReactDOM.findDOMNode(this.refs.username).value.trim();
    this.props.onChangeForm(input);
  },

  render: function(){

    return(
      <form className="UserSearchForm"  >
        <input type="text" ref="username" onKeyUp={this.handleWriteDown}/>
      </form>
    );
  }
});
