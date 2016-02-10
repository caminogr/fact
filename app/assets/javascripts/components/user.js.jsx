var User = React.createClass({

  render: function(){
    return(
      <div className="User">
        <p>
          {this.props.user.first_name}
        </p>
      </div>
    );
  }
});
