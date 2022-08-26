# Mad-qats

Checklist and automation software

## Frontend

The mad-qats frontend is designed to streamline tasks by generating checklists based on the SOPs developed by the department using the tool. Designed in part for the use in the QA department the general layout and process should be easily modified for the use in other departments within System76. 

This tool connects with the mad-qats server to pull down lists and report actions back to the server when a job is completed or a task needs to be run. 

### Features

* Two way communication with server.
  
  1. Downloading of lists and their actions (this could be a script that is needed.)
  
  2. Updating the server via POST command that a task has been checked off. 

* Auto generation of lists based on PR or other integration.
  
  * Left pane: Check list.
  
  * Right pane: Information about the task. This could be a button, or just listed instruction.

* 
