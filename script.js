$(document).ready(function(){


   $('#edit').on('click', function(){   
      editVideo();
    }  
  })

   $('#add').on('click', function(){
      addVideo();
    }  
  })

   $('#delete').on('click', function(){
      deleteVideo();
    }  
  })

   function deleteVideo(){
    request('DELETE', '/videos/:id/delete' + taskId, null).done(function(response){
    console.log(response);
  })
   }
   

   // What's an event delegation?
   function request(method, url, data){
  return $.ajax({
    method: method,
    url: url,
    dataType: 'json',
    data: data
  })
  }