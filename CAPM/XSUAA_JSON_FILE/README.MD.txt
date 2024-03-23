{
    "xsappname": "07springodata",
    "tenant-mode": "dedicated",
    "scopes": [
        {
            "name": "$XSAPPNAME.UserDisplay",
            "description": "To Display vendor data"
        },
        {
            "name": "$XSAPPNAME.UserEdit",
            "description": "To Create new vendor data"
        }
    ],
    "role-templates": [
        {
            "name": "Viewer",
            "description": "View, Vendor Details",
            "scope-references": [
                "$XSAPPNAME.UserDisplay"
            ]
        },
        {
            "name": "Editor",
            "description": "Edit and Create new Vendor Details",
            "scope-references": [
                "$XSAPPNAME.UserEdit"
            ]
        }
    ]
	"authorities":["$ACCEPT_GRANTED_AUTHORITIES"],
	"aouth2-configuration":{
							"token-validity":9000
							"redirect-uris":["https://api.cf.us10-001.hana.ondemand.com/"]							
	}
	"xsenableasyncservice":true
}

