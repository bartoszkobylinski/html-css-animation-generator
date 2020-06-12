require './alphabet.rb'

# def how to create hex color
def hex_number()
    hex_number = Random.bytes(3).unpack1('H*')
    return hex_number
end

# def how to choose pair of numbers from array

# def how to choose random number from range
def random_number()
    random_number = rand(800)
    return random_number
end
# def how to create, edit and save a file

# def how to create, and add keframe


def generate_keyfarmes_line(percentage, hex_number, random_number)

    keyrames_line = (" "+ percentage.to_s+"%    {background-color:#" + hex_number().to_s + "; left:" + random_number().to_s+"px; top:" + random_number().to_s+ "px;}\n")
    return keyrames_line
end

def generate_keyfarmes_line_translate(step_change, hex_number, left, top)

    keyrames_line = (" "+ step_change.to_s+"%    {background-color:#" + hex_number().to_s + "; transform: translate(" + left.to_s+"px, " + top.to_s+ "px);}\n")
    return keyrames_line
end

def generate_keyfarmes_line_after_translate(percentage, hex_number, left, top)
    if percentage > 50
        hex_number = "c58c79"
        keyrames_line = (" "+ percentage.to_s+"%    {background-color:#" + hex_number + "; left:" + left.to_s+"px; top:" + top.to_s+ "px;}\n")
    else
        keyrames_line = (" "+ percentage.to_s+"%    {background-color:#" + hex_number().to_s + "; left:" + left.to_s+"px; top:" + top.to_s+ "px;}\n")
    end    
    return keyrames_line
end



def create_example(create_example_number, key_num,steps,step_change,left,right)
    
    example = "@keyframes example" + create_example_number.to_s + " {\n"
    end_phrase = " }\n"
    for step in steps
        if step < step_change
            a = generate_keyfarmes_line(step,hex_number,random_number)
            example << a
        elsif step == step_change
            a = generate_keyfarmes_line_translate(step_change, hex_number, left, right)
            example << a      
        else
            a = generate_keyfarmes_line_after_translate(step, hex_number, left, right)
            example << a
        end
    end
    example << end_phrase
    return example
end

def generate_examples_to_file(coordinates)  
    beginning = "<!DOCTYPE html>\n<html>\n<head>\n<style>\nbody{background-color:#ececec;}\n" 
    (1..coordinates.size()).each { |n|
        if  n == coordinates.size()
            div_text = ".div#{n}{\nwidth:10px;\nheight: 10px;\nbackground-color: red;\nposition: absolute;\nanimation-name: example1;\nanimation-duration: 15s;\ndisplay:inline-block;\n}\n"
            beginning << div_text
        else
            div_text = ".div#{n},\n"
            beginning << div_text
        end
    }
    (2..coordinates.size()).each { |n|
        div_text = ".div#{n}{\n animation-name: example#{n};\n}\n"
        beginning << div_text
    }


    coordinates.each do |key,value|
    
        step_change = 72
        steps = [0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,99]
        left = coordinates[key][0]
        top = coordinates[key][1]
        example = create_example(key,steps,step_change,left,top)
        beginning << example
    
    end
    
    ending_text_of_head = "\n</style>\n</head>\n<body>\n"
    beginning << ending_text_of_head
    body_start = "<body>\n"
    beginning << body_start
    (1..coordinates.size()).each { |n|
        div_text = "<div class=\"div#{n}\"></div>\n"
        beginning << div_text
    }
    end_text_of_file = "</body>\n</html>"
    beginning << end_text_of_file
    return beginning
end


text = "dzięki za twoje devstories"
highest_x = 100
lowest_y = 100
create_example_number = 1
div_number = 1
beginning = "<!DOCTYPE html>\n<html>\n<head>\n<style>\nbody{background-color:#ececec;}\n" 
div_style = ""
div_exampl = ""
keyframes_text = "" 
div_class_html = ""

text.each_char { |letter|   

    step_change = 72
    steps = [0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,99]

        if letter == 'k'
            if highest_x < 440
                k = k_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                k = k_letter(highest_x, lowest_y)
            end
                k.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == " "
            highest_x = 100
            lowest_y += 70
        elsif letter == 'd'
                if highest_x < 440
                    d = d_letter(highest_x, lowest_y)
                else
                    highest_x = 0
                    lowest_y += 70 
                    d = d_letter(highest_x, lowest_y)
                end
                    d.each { | key,value |
                    value.each {|key,value|
                        left = value[0]
                        if left > highest_x
                            highest_x = left
                        end
                        top = value[1]
                        div_style_current = ".div#{div_number},\n"
                        div_style << div_style_current
                        div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                        div_class_html << div_class_html_current
                        div_number += 1
                        div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                        div_exampl << div_exampl_current
                        example = create_example(create_example_number,key,steps,step_change,left,top)
                        keyframes_text << example
                        create_example_number +=1
                        
                    }
                highest_x +=15   
                }
        elsif letter == 'i'
                if highest_x < 440
                    i = i_letter(highest_x, lowest_y)
                else
                    highest_x = 0
                    lowest_y += 70 
                    i = i_letter(highest_x, lowest_y)
                end
                    i.each { | key,value |
                    value.each {|key,value|
                        left = value[0]
                        if left > highest_x
                            highest_x = left
                        end
                        top = value[1]
                        div_style_current = ".div#{div_number},\n"
                        div_style << div_style_current
                        div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                        div_class_html << div_class_html_current
                        div_number += 1
                        div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                        div_exampl << div_exampl_current
                        example = create_example(create_example_number,key,steps,step_change,left,top)
                        keyframes_text << example
                        create_example_number +=1
                        
                    }
                highest_x +=15   
                }
        elsif letter == 'z'
            if highest_x < 440
                z = z_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                z = z_letter(highest_x, lowest_y)
            end
                z.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == 'ę'
            if highest_x < 440
                e = ee_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                e = ee_letter(highest_x, lowest_y)
            end
                e.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == 'j'
            if highest_x < 440
                j = j_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                j = j_letter(highest_x, lowest_y)
            end
                j.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == 'a'
            if highest_x < 440
                a = a_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                a = a_letter(highest_x, lowest_y)
            end
                a.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1         
                }
            highest_x +=15   
            }
        elsif letter == 't'
            if highest_x < 440
                t = t_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                t = t_letter(highest_x, lowest_y)
            end
                t.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == 'w'
            if highest_x < 440
                w = w_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                w = w_letter(highest_x, lowest_y)
            end
                w.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == 'o'
            if highest_x < 440
                o = o_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                o = o_letter(highest_x, lowest_y)
            end
                o.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == 'v'
            if highest_x < 440
                v = v_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                v = v_letter(highest_x, lowest_y)
            end
                v.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == 'r'
            if highest_x < 440
                r = r_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                r = r_letter(highest_x, lowest_y)
            end
                r.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        elsif letter == 's'
            if highest_x < 440
                highest_x +=5
                s = s_letter(highest_x, lowest_y)
            else
                highest_x = 105
                lowest_y += 70 
                s = s_letter(highest_x, lowest_y)
            end
                s.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=20   
            }
        elsif letter == 'e'
            if highest_x < 440
                e = e_letter(highest_x, lowest_y)
            else
                highest_x = 0
                lowest_y += 70 
                e = e_letter(highest_x, lowest_y)
            end
                e.each { | key,value |
                value.each {|key,value|
                    left = value[0]
                    if left > highest_x
                        highest_x = left
                    end
                    top = value[1]
                    div_style_current = ".div#{div_number},\n"
                    div_style << div_style_current
                    div_class_html_current = "<div class=\"div#{div_number}\"></div>\n"
                    div_class_html << div_class_html_current
                    div_number += 1
                    div_exampl_current = ".div#{div_number}{\n animation-name: example#{div_number};\n}\n"
                    div_exampl << div_exampl_current
                    example = create_example(create_example_number,key,steps,step_change,left,top)
                    keyframes_text << example
                    create_example_number +=1
                    
                }
            highest_x +=15   
            }
        end
    
}
beginning = "<!DOCTYPE html>\n<html>\n<head>\n<style>\nbody{background-color:#ececec;}\n" 
end_text_of_file = "</body>\n</html>"
div_style = div_style[0..-3]    
div_style <<"{\nwidth:10px;\nheight: 10px;\nbackground-color: red;\nposition: absolute;\nanimation-name: example1;\nanimation-duration: 20s;\ndisplay:inline-block;\n}\n" 

        #puts(div_exampl)
        #puts(keyframes_text) 
        #puts(div_class_html)
        css_file = ""
        css_file << beginning
        css_file << div_style
        css_file << div_exampl
        css_file << keyframes_text
        css_file << "\n</style>\n</head>\n<body>\n"
        css_file << div_class_html 
        css_file << end_text_of_file
        

File.open('test1.html', 'w'){ |f| f.write css_file}
=begin
    coordinates.each { |key,value| 
        if key == letter
            value.each { |key, value|
                #print(key.to_s + " that is value => " + value[0].to_s + " and value => " +value[1].to_s+ " ")
            } 
        end 

    }
=end
 


