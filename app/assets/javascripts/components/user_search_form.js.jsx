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
        <table>
          <tbody>
            <tr>
              <th className="form-label-cell">
                <label>グループ名</label>
              </th>
              <td className="form-field-cell">
                <input type="text" name="group[name]" className="form-field" />
              </td>
            </tr>
            <tr>
              <th className="form-label-cell">
                <label>メンバー</label>
              </th>
              <td className="form-field-cell">
                <div className="addUserField form-field">
                  <div className="selectedUsers">
                    {this.props.selecteduserlist}
                  </div>
                  <input type="text" id="user_search_form" ref="username" onKeyUp={this.handleWriteDown} />
                </div>
                {hiddenlist}
                <ul>
                  {this.props.userlist}
                </ul>
                <div className="actions">
                  <input type="submit" value="作成" className="border-radius" />
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    );
  }
});
