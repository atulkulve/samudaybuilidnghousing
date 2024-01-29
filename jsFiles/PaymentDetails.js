// JScript File

function check(obj)
    {
       var buttons = document.getElementById('ctl00_ContentPlaceHolder2_paymentGrid').getElementsByTagName("input");
       for(var j = 0 ;j<buttons.length;j++)
       {
          if(buttons[j] == obj)
          continue;
          var work = buttons[j];
          work.checked = !obj.checked;
       }
    }

function checkOne(obj)
    {
       var buttons = document.getElementById('ctl00_ContentPlaceHolder2_transactionGrid').getElementsByTagName("input");
       for(var j = 0 ;j<buttons.length;j++)
       {
          if(buttons[j] == obj)
          continue;
          var work = buttons[j];
          work.checked = !obj.checked;
       }
    }