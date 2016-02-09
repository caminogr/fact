var User = React.createClass({

  render: function(){
    return(
      <div className="User">
        <p>
          {this.props.name}
        </p>
      </div>
    );
  }
});
