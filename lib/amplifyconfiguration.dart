const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:b94a7eb8-3380-46b5-acba-19f1aa48bc05",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_unzLgyRjc",
                        "AppClientId": "2foldrl1l4jgr2mkp8ammjk20g",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "NAME",
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": [
                                "REQUIRES_LOWERCASE",
                                "REQUIRES_UPPERCASE",
                                "REQUIRES_NUMBERS",
                                "REQUIRES_SYMBOLS"
                            ]
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://r56j5iznwrd4pmh6goitsfvnwm.appsync-api.us-east-1.amazonaws.com/graphql",
                        "Region": "us-east-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-2hwkzmqr5nhrvobtipxcgzc64e",
                        "ClientDatabasePrefix": "smartvid_API_KEY"
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "smartvid-storage01535-staging",
                        "Region": "us-east-1"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "smartvid": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://r56j5iznwrd4pmh6goitsfvnwm.appsync-api.us-east-1.amazonaws.com/graphql",
                    "region": "us-east-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-2hwkzmqr5nhrvobtipxcgzc64e"
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "smartvid-storage01535-staging",
                "region": "us-east-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';