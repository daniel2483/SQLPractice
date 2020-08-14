select count(*) Total,
				sum(DispatchStatus=0) "Not processed",
				sum(DispatchStatus=1) "Pending",
				sum(DispatchStatus=2) "Scheduled",
				sum(Dispatchstatus=3) "Sent",
				sum(DispatchStatus=4) "Received",
				sum(DispatchStatus=5) "Viewed",
				sum(DispatchStatus=6) "Rejected",
				sum(Dispatchstatus=7) "Completed"
				from doforms.rir_proyecto;