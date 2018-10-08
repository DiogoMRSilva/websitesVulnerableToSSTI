import re

person = "xx{{\"asdasd\"+\"lala\"}}  {1+1}xxx"

regex = r"{{([^}]*)}}"
matches = re.finditer(regex, person, re.MULTILINE)
for matchNum, match in enumerate(matches):
    eval_result = eval(match.group(1))
    person = person.replace(str(match.group()),str(eval_result))

print(person)