
var formData = {};
var count = 1;
$("#newTaskBtn").click(function() {
    var taskField = $(".secTask").first().clone().val("");
    $(this).parent().append("<br>");
    $(this).parent().append(taskField);
    var newBtn = $(this).clone(true,true);
    $(this).css("display","none");
    $(this).parent().append(newBtn);
    $(this).remove();
});

$("#newSecBtn").click(function() {
        window.count += 1;
        var sectionName = "Developer " + window.count.toString();
        var title = $("<label></label>").text(sectionName);
        //alert("ads");
        $("#sections").append(title);
        $("#sections").append("<br>");
        var newSection = $(".section").first().clone(true);
        $("#sections").append(newSection);
        $("#sections").append("<br>");
        var newBtn = $("#newSecBtn").clone(true,true);
        $("#newSecBtn").remove();
        $("#sections").append(newBtn);
});

$("#toSecond").click(function() {
    //$("#formTitle").html("Step 2 of 3: Work Distribution");
    $("#step1").css("display","none");
    $("#step2").css("display","block");
    window.formData["projectName"] = $("#name").val();
    window.formData["repo"] = $("#repo option:selected").text();
});

var mCount = 3;
$("#newMilBtn").click(function() {
            window.mCount += 1;
            var mileName = "Milestone " + window.mCount.toString();
            var title = $("<label></label>").text(mileName);
            $("#milestones").append("<br>");
            $("#milestones").append(title);
            var tLabel = $("<p></p>").text(" Milestone Name: ").addClass("form-control-static indent");
            var newMile = $(".mileTitle").first().clone().val("");
            $("#milestones").append(tLabel);
            $("#milestones").append(newMile);
            var date = $("<p></p>").text("Estimate Deadline: ").addClass("form-control-static indent");
            $("#milestones").append(date);
            var newDate = $(".mileDate").first().clone().val("");
            $("#milestones").append(newDate);
            var taskLabel = $("<p></p>").text("Milestone Task(s): ").addClass("form-control-static indent");
            var newTask = $(".mileTask").first().clone().val("");
            $("#milestones").append(taskLabel);
            $(".taskMsg").first().clone().appendTo("#milestones");
            $("#milestones").append(newTask);
            $("#milestones").append("<br>");
            var newBtn = $("#newMilBtn").clone(true,true);
            $("#newMilBtn").remove();
            $("#milestones").append(newBtn);
    });

$("#toThird").click(function() {
    //$("#formTitle").html("Step 3 of 3: Milestones");
    $("#step2").css("display","none");
    $("#step3").css("display","block");
    var sections = [];
    var totalWork = 0;
    $(".section").each(function(index) {
        var section = {};
        section["tasks"] = [];
        section["developer"] = $(".secDeveloper option:selected", this).text();
        section["section"] = $(".secName", this).val();
        section["percentage"] = parseInt($(".secPer", this).val());
        totalWork = totalWork + section["percentage"];
        $(".secTask",this).each(function(subindex) {
            section["tasks"][subindex] = $(this).val();
        });
        sections[index] = section;
    });
    for (var i = 0; i < sections.length; i++) {
        sections[i]["percentage"] = sections[i]["percentage"]/totalWork*100;
    }
    $(".mileDate").each(function() {
        var d = new Date();
        var month = d.getMonth()+1;
        var day = "";
        if (d.getDate()<10) {
            day = "0" + d.getDate();
        }else {
            day = toString(d.getDate());
        }        
        var date = d.getFullYear() + "-" + month + "-" + day;
        $(this).attr("min",date);
    });
    $(".mileTask").each(function() {
        for (var i = 0; i < sections.length; i++) {
            var devName = sections[i]["developer"];
            for (var j = 0; j < sections[i]["tasks"].length ; j++) {
                var devTask = sections[i]["tasks"][j];
                var taskOption =  $("<option></option>").text(devName + " - " + devTask);
                $(this).append(taskOption);
            }
        }
    });
    window.formData["sections"] = sections;
});

$("#lastStep").click(function() {
    var milestones = [];
    $(".mileTitle").each(function(index) {
        var milestone = {};
        milestone["name"] = $(this).val();
        milestone["deadline"] = $(".mileDate").eq(index).val();
        milestone["tasks"] = [];
        var selected = $(".mileTask").eq(index).find(":selected");
        $.each(selected, function(index) {
            milestone["tasks"][index] = $(this).text();
        });
        milestones[index] = milestone;
    });
    window.formData["milestones"] = milestones;
    console.log(formData);
    
    $.ajax({                    
        url: "http://127.0.0.1:8000/store_project_info",     
        type: 'post', // performing a POST request
        data : formData,
        dataType: 'json',                   
        success: function(data)         
        {
            console.log(data);
        } 
    });
});

$("#backFirst").click(function() {
    $("#step1").css("display","block");
    $("#step2").css("display","none");
});

$("#backSecond").click(function() {
    $("#step2").css("display","block");
    $("#step3").css("display","none");
})
