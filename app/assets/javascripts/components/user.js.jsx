var User = React.createClass({

  render: function(){
    return(
      <div className="User">
        <a>
          {this.props.user.first_name}
        </a>
      </div>
    );
  }
});
