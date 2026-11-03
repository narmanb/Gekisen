turf/New_Vegeta_Icons
	IconsPack1
		icon = 'IconPackVegeta (3).dmi'
		Turf0001
			icon_state = "1"
			density = 0
		Turf0002
			icon_state = "2"
			density = 1
		Turf0003
			icon_state = "3"
			density = 1
		Turf0004
			icon_state = "4"
			density = 1
		Turf0005
			icon_state = "5"
			density = 1
		Turf0006
			icon_state = "6"
			density = 1
		Turf0007
			icon_state = "7"
			density = 1
		Turf0008
			icon_state = "8"
			density = 1
		Turf0009
			icon_state = "9"
			density = 1
		Turf0010
			icon_state = "10"
			density = 1
		Turf0011
			icon_state = "11"
			density = 1
		Turf0012
			icon_state = "12"
			density = 1
		Turf0013
			icon_state = "13"
			density = 1
		Turf0014
			icon_state = "14"
			density = 1
		Turf0015
			icon_state = "15"
			density = 1
		Turf0016
			icon_state = "16"
			density = 1
		Turf0017
			icon_state = "17"
			density = 1
		Turf0018
			icon_state = "18"
			density = 1
		Turf0019
			icon_state = "19"
			density = 1
		Turf0020
			icon_state = "20"
			density = 1
		Turf0021
			icon_state = "21"
			density = 1
		Turf0022
			icon_state = "22"
			density = 1
		Turf0023
			icon_state = "23"
			density = 1
		Turf0024
			icon_state = "24"
			density = 1
		Turf0025
			icon_state = "25"
			density = 1
		Turf0026
			icon_state = "26"
			density = 1
		Turf0027
			icon_state = "27"
			density = 1
		Turf0028
			icon_state = "28"
			density = 1
		Turf0029
			icon_state = "29"
			density = 1
		Turf0030
			icon_state = "30"
			density = 1
		Turf0031
			icon_state = "31"
			density = 1
		Turf0032
			icon_state = "32"
			density = 1
		Turf0033
			icon_state = "33"
			density = 1
		Turf0034
			icon_state = "34"
			density = 1
		Turf0035
			icon_state = "35"
			density = 1
		Turf0036
			icon_state = "36"
			density = 1
		Turf0037
			icon_state = "37"
			density = 1
		Turf0038
			icon_state = "38"
			density = 0
		Turf0039
			icon_state = "39"
			density = 0
		Turf0040
			icon_state = "40"
			density = 0
		Turf0041
			icon_state = "41"
			density = 0
		Turf0042
			icon_state = "42"
			density = 0
		Turf0043
			icon_state = "43"
			density = 0
		Turf0044
			icon_state = "44"
			density = 0
		Turf0045
			icon_state = "45"
			density = 0
		Turf0046
			icon_state = "46"
			density = 1
		Turf0047
			icon_state = "47"
			density = 1
		Turf0048
			icon_state = "48"
			density = 1
		Turf0049
			icon_state = "49"
			density = 1
		Turf0050
			icon_state = "50"
			density = 1
		Turf0051
			icon_state = "51"
			density = 0
		Turf0052
			icon_state = "52"
			density = 1
		Turf0053
			icon_state = "53"
			density = 1
		Turf0054
			icon_state = "54"
			density = 1
		Turf0055
			icon_state = "55"
			density = 0
		Turf0056
			icon_state = "56"
			density = 0
		Turf0057
			icon_state = "57"
			density = 0
		Turf0058
			icon_state = "58"
			density = 0
		Turf0059
			icon_state = "59"
			density = 0
		Turf0060
			icon_state = "60"
			density = 0
		Turf0061
			icon_state = "61"
			density = 0
		Turf0062
			icon_state = "62"
			density = 1
		Turf0063
			icon_state = "63"
			density = 0
		Turf0064
			icon_state = "64"
			density = 1
		Turf0065
			icon_state = "65"
			density = 0
		Turf0066
			icon_state = "66"
			density = 0
		Turf0067
			icon_state = "67"
			density = 0
		Turf0068
			icon_state = "68"
			density = 0
		Turf0069
			icon_state = "69"
			density = 0
		Turf0070
			icon_state = "70"
			density = 1
		Turf0071
			icon_state = "71"
			density = 0
		Turf0072
			icon_state = "72"
			density = 1
		Turf0073
			icon_state = "73"
			density = 1
		Turf0074
			icon_state = "74"
			density = 1
		Turf0075
			icon_state = "75"
			density = 1
		Turf0076
			icon_state = "76"
			density = 1
		Turf0077
			icon_state = "77"
			density = 1
		Turf0078
			icon_state = "78"
			density = 0
		Turf0079
			icon_state = "79"
			density = 0
		Turf0080
			icon_state = "80"
			density = 0
		Turf0081
			icon_state = "81"
			density = 0
		Turf0082
			icon_state = "82"
			density = 0
		Turf0083
			icon_state = "83"
			density = 0
		Turf0084
			icon_state = "84"
			density = 0
		Turf0085
			icon_state = "85"
			density = 0
		Turf0086
			icon_state = "86"
			density = 0
		Turf0087
			icon_state = "87"
			density = 0
		Turf0088
			icon_state = "88"
			density = 0
		Turf0089
			icon_state = "89"
			density = 0
			Enter(atom/movable/A)
				if(istype(A,/mob) && !A.density)
					return 1
				if(istype(A,/mob) && A.density)
					return 0
				if(istype(A,/obj/blasts))
					return 1
		Turf0090
			icon_state = "90"
			density = 1
		Turf0091
			icon_state = "91"
			density = 1
		Turf0092
			icon_state = "92"
			density = 1
		Turf0093
			icon_state = "93"
			density = 1
		Turf0094
			icon_state = "94"
			density = 1