var User = React.createClass({

  render: function(){
    return(
      <div className="User">
        <img src={this.props.user.avatar.url} className="border-radius" />
        <a>
          {this.props.user.first_name}
        </a>
      </div>
    );
  }
});
