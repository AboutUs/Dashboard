$(function(){
  $('#nonfeatured').masonry({ singleMode: true });
  $('.sparkline').sparkline('html',{
    width: '220px',
    height: '45px',
    fillColor: false,
    lineColor: '#ffffff',
    lineWidth: 5
  });
});
