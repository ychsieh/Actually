var data3 = 
    {
        projectname: 'Facebook',
        expected:[
            {
                name: 'developer1',
                y: 30, //percentage
                drilldown: 'expdeveloper1' //'exp' + name
            },{
                name: 'developer2',
                y: 40, 
                drilldown: 'expdeveloper2'
            },{
                name: 'developer3',
                y: 50, 
                drilldown: 'expdeveloper3'
            }
        ],

        actual:[
            {
                name: 'developer1',
                y: 50, 
                drilldown: 'actdeveloper1'  //'act' + name
            },{
                name: 'developer2',
                y: 40, 
                drilldown: 'actdeveloper2'
            },{
                name: 'developer3',
                y: 50,
                drilldown: 'actdeveloper3'
            }
        ],

        expectedtasks:[
            {
                id: 'expdeveloper1', //'exp' + name
                name: 'Expected Progress',
                data: [   //percentage of each task
                    ['task1', 20],
                    ['task2', 70],
                    ['task3', 50]
                ]
            },{
                id: 'expdeveloper2',
                name: 'Expected Progress',
                data: [
                    ['task1', 30],
                    ['task2', 40],
                    ['task3', 50]
                ]
            },{
                id: 'expdeveloper3',
                name: 'Expected Progress',
                data: [
                    ['task1', 30],
                    ['task2', 40],
                    ['task3', 50]
                ]
            }
        ],

        actualtasks:[
            {
                id: 'actdeveloper1', //'act' + name
                name: 'Actual Progress',
                data: [
                    ['task1', 10],
                    ['task2', 30],
                    ['task3', 90]
                ]
            },{
                id: 'actdeveloper2',
                name: 'Actual Progress',
                data: [
                    ['task1', 30],
                    ['task2', 40],
                    ['task3', 50]
                ]
            },{
                id: 'actdeveloper3',
                name: 'Actual Progress',
                data: [
                    ['task1', 30],
                    ['task2', 40],
                    ['task3', 50]
                ]
            }
        ]
    };

var data10 = [ // the array of delayed tasks decided by checking if expected progress exceed 90%
            {
            task: 'Task 1', //task name
            date: '11/16/2014',  //due date
            late: 'Past Due', // check if the task past the due date
            developer: 'Long', //developer name
            expected: 100,  //expected progress
            actual: 85      //actual progress
            },
            {
            task: 'Task 2',
            date: '11/16/2014',
            late: 2, //if not past due then return how many days left
            developer: 'Jin', 
            expected: 95,
            actual: 85
            },
            {
            task: 'Task 3',
            date: '11/16/2014',
            late: 6, 
            developer: 'Ya-Chen', 
            expected: 90,
            actual: 75
            },
            {
            task: 'Task 4',
            date: '11/16/2014',
            late: 3,
            developer: 'Xinhe', 
            expected: 95,
            actual: 90
            }
        ];

//developer page
var data = {
    projectname: 'Amazon',
    projectprogress: 66,
    sectionname: 'Front-end',
    sectionprogress: 85,
    tasks: [
        {
            task: 'task1',
            taskprogress: 78
        },
        {
            task: 'task2',
            taskprogress: 95
        },
        {
            task: 'task3',
            taskprogress: 50
        },
        {
            task: 'task4',
            taskprogress: 20
        },
        {
            task: 'task5',
            taskprogress: 45
        },
        {
            task: 'task6',
            taskprogress: 85
        }
    ]
}