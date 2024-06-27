#!/usr/bin/python3

import yaml
import pprint

def traverse_yaml(data):
    assert isinstance(data, dict)
    groups = data['groups']
    assert isinstance(groups, list)
    kernel_name_code_object_map = {}
    global_kernel_order = 0
    rearrange_code_object_list = []
    for index in range(len(groups)):
        group = groups[index]
        assert isinstance(group, dict)
        group_content_list = group['group' + str(index)]
        assert isinstance(group_content_list, list)
        group_content = group_content_list[0]
        assert isinstance(group_content, dict)
        assert 'name' in group_content and 'location' in group_content
        #print(group_content['name'] + ' ' + group_content['location'])
        kernel_name = group_content['name']
        code_object_location = group_content['location']
        if kernel_name not in kernel_name_code_object_map:
            kernel_name_code_object_map[kernel_name] = {'location': code_object_location, 'order': global_kernel_order}
            rearrange_code_object_list.append({'name': kernel_name, 'location': code_object_location})
            global_kernel_order += 1
        else:
            assert isinstance(kernel_name_code_object_map[kernel_name], dict)
            assert kernel_name_code_object_map[kernel_name]['location'] == code_object_location

    assert len(kernel_name_code_object_map) == len(rearrange_code_object_list)
    pprint.pprint(rearrange_code_object_list)
    print(len(rearrange_code_object_list))

def read_and_traverse_yaml(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = yaml.load(file, Loader=yaml.FullLoader)
            traverse_yaml(data)
    except Exception as e:
        print(f"Error reading or parsing the YAML file: {e}")

if __name__ == "__main__":
    yaml_file_path = 'graph0.yaml'
    read_and_traverse_yaml(yaml_file_path)

