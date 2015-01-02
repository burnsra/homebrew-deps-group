#! /usr/bin/env python
import sys
import subprocess
import networkx as nx

def get_all_packages():
    packages = subprocess.check_output(["brew", "list"]).split()

    return packages


def get_deps_graph(option):
    brew_list = get_all_packages()
    deps = subprocess.check_output(["brew", "deps", "--installed"]).splitlines()

    G = nx.DiGraph()
    for dep in deps:
        packages = dep.split()
        parent = (packages[0])[:-1]

        if len(packages) > 1:
            for node in packages[1:]:
                G.add_edge(parent, node)
        else:
            G.add_node(parent)

    cc = nx.weakly_connected_components(G)
    for c in cc:
        if option == 'top':
            common = list(set(c) & set(brew_list))
            leaves = G.in_degree_iter(c)

            top = [n[0] for n in leaves if n[1] == 0]
            print top
        elif option == 'all':
            print c


def main(argv):
    option = argv[0]
    get_deps_graph(option)

if __name__ == '__main__':
    main(sys.argv[1:])