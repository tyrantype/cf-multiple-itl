# CERTAINTY FACTOR
**Sistem Pakar Untuk Mengidentifikasi Kepribadian Siswa Menggunakan Metode Certainty Factor Dalam Mendukung Pendekatan Guru**

## API Usage

### Calculate Certainty Factor
**POST** /api/certainty-factor
Request Body :
```
[
    {
        "id": "I0006",
        "userCF": 0.4
    },
    {
        "id": "I0002",
        "userCF": 0.8
    },
    {
        "id": "I0007",
        "userCF": 0.2
    },
    {
        "id": "I0003",
        "userCF": 0.6
    }
]
```
Response :
```
[
	{
		"id": "T0003",
		"typeName": "Matematika-Logika",
		"detail": "Detail bla bla bla bla",
		"fields": ["Programmer", "Guru Matematika", "Teknisi"],
		"rules": [{
				"id": "RL0003",
				"interestName": "nama minat bakat 3",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123
			},
			{
				"id": "RL0004",
				"interestName": "nama minat bakat 4",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123
			},
			{
				"id": "RL0005",
				"interestName": "nama minat bakat 5",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123
			}
		],
		"combination": [0.44, 0.823, 0.561],
		"cf": 0.6342
	},

	{
		"id": "T0001",
		"typeName": "Inter-personal",
		"detail": "Detail bla bla bla bla",
		"fields": ["Programmer", "Guru Matematika", "Teknisi"],
		"rules": [
			{
				"id": "RL0003",
				"interestName": "nama minat bakat 3",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123,
				"formula": "0.8 * (0.5 - 0.3) = 0.123"
			},
			{
				"id": "RL0004",
				"interestName": "nama minat bakat 4",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123,
				"formula": "0.8 * (0.5 - 0.3) = 0.124"
			},
			{
				"id": "RL0005",
				"interestName": "nama minat bakat 5",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123,
				"formula": "0.8 * (0.5 - 0.3) = 0.125"
			}
		],
		"combination": [
			{
				"cf": -0.126,
				"formula": "0.123 + 0.124 (1 - 0.123) = -0.126"
			}, 
			{
				"cf: -0.128,
				"formula": "-0.126 + -0.127 (1 + -0.126) = 0.128"
			}, 
			{
				"cf: -0.130,
				"formula": "(-0.128 + 0.129) / 1 - min(-0.128, 0.129) = 0.130"
			},
		],
		"cf": 0.130
	},
	{
		"id": "T0008",
		"typeName": "Linguistik",
		"detail": "Detail bla bla bla bla",
		"fields": ["Penulis", "Wartawan"],
		"rules": [{
				"id": "RL0003",
				"interestName": "nama minat bakat 3",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123
			},
			{
				"id": "RL0004",
				"interestName": "nama minat bakat 4",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123
			},
			{
				"id": "RL0005",
				"interestName": "nama minat bakat 5",
				"mb": 0.5,
				"userCF": 0.8,
				"cf": 0.123
			}
		],
		"combination": [0.44, 0.823, 0.561],
		"cf": 0.3227
	}
]
```

### CRUD users, types, interests, fields, etc
#### Get user
**GET** /api/user/{username}
Response :
```
{
    "statusCode": 200,
    "message: "Berhasil mendapatkan data",
    "data": [
        {
            "id": "U0001",
            "username": "johndoe",
            "fullName": "John Doe"
        }
    ]
}
```

#### Create user
**POST** /api/user
Request Body :
```
{
    "username": "johndoe",
    "fullName": "John Doe"

}
```
Response :
{
  "statusCode": 200,
  "message": "Berhasil membuat user"
}

#### Update user
**PUT** /api/user/{username}
Request Body :
```
{
    "username": "johndoe123,
    "fullName": "John Doe Jr."

}
```
Response :
{
  "statusCode": 200,
  "message": "Berhasil mengubah data"
}

#### Delete user
**DELETE** /api/user/{username}
Response :
{
  "statusCode": 200,
  "message": "Berhasil menghapus user"
}

