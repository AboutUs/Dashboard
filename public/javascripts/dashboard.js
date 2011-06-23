$(function(){
  $('#nonfeatured').masonry({ singleMode: true });
  $('.nonfeatured .sparkline').sparkline('html',{
    width: '100px',
    height: '25px',
    fillColor: false,
    lineColor: '#dddddd',
    lineWidth: 1,
    spotColor: '',
    spotRadius: 0
  })
  $('.featured .sparkline').sparkline('html',{
    width: '220px',
    height: '30px',
    fillColor: false,
    lineColor: '#ffffff',
    lineWidth: 3,
    spotRadius: 2.5,
    spotColor: '#0000ff',
    minSpotColor: '#ff0000',
    maxSpotColor: '#00ff00'
  });
});
